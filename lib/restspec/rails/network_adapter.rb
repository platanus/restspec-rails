module Restspec
  module Rails
    class NetworkAdapter
      include ActionDispatch::Integration::Runner

      def initialize
        @app = ::Rails.application
      end

      def request(request_object)
        send request_object.method,
          request_object.url,
          request_object.payload,
          request_object.headers
        
        [response.code.to_i, response.headers, response.body]
      end

      def reset_template_assertion
        nil
      end
    end
  end
end
