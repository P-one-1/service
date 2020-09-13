class RegisterUser

    def initialize(user)
      @user = user
    end

    def execute
        return OpenStruct.new(success?: false, user: nil, errors: @user.errors) 
        unless @user.save
            send_welcome_email
            notify_slack_service.execute
            if @user.admin?
                log_new_admin
            else
                log_new_user
            end
            OpenStruct.new(success?: true, user: @user, errors: nil)
        end
    end  
    private  
    def notify_slack_service
        @notify_slack_service ||= NotifySlack.new(@user)
    end

end