module JsonResponder
  extend ActiveSupport::Concern

  included do
    private
      def respond_with_json(data_title, data)
        respond_to do |format|
          message = { :status => "ok", :message => "Success!", data_title => data }
          format.json { render :json => message }
      end
    end

    private
      def respond_with_json_error(error_name, error_data)
        respond_to do |format|
          message = { :status => "error", :message => "An error has occured.", error_name => error_data }
          format.json { render :json => message }
      end
    end
  end
end
