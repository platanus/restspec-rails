module Restspec
  module Rails
    class NetworkAdapter
      include ActionDispatch::Integration::Runner

      def initialize
        @app = ::Rails.application
      end

      def request(request_object)
        public_send request_object.method,
                    request_object.url,
                    request_object.raw_payload,
                    request_object.headers
        
        [response.code.to_i, response.headers, response.body]
      end

      def reset_template_assertion
        nil
      end
    end
  end
end
