module Fog
  module Compute
    class Brightbox
      class Real
        # Get full details of the zone.
        #
        # @param [String] identifier Unique reference to identify the resource
        # @param [Hash] options
        # @option options [Boolean] :nested passed through with the API request. When true nested resources are expanded.
        #
        # @return [Hash] if successful Hash version of JSON object
        #
        # @see https://api.gb1.brightbox.com/1.0/#zone_get_zone
        #
        def get_zone(identifier, options = {})
          return nil if identifier.nil? || identifier == ""
          wrapped_request("get", "/1.0/zones/#{identifier}", [200], options)
        end
      end
    end
  end
end