module Mustafa
    module Input
        class DELETE  
            INSTANCE = DELETE.new

            getter :params

            def initialize
                @params = {} of String => Array(String)
            end

            ###
            # this method return post query parameters
            # 
            ###
            def value_array(key : String) : Array(String)
                if @params.has_key?(key)
                    @params[key]
                else
                    nil
                end
            end

            ###
            # this method return only a post query parameter 
            # 
            ###
            def value(key : String) : String
                if @params.has_key?(key)
                    @params[key][0]
                else
                    ""
                end
            end

            ###
            # this method is implement for develop envoriment
            ###
            def set_with_query(query : String)
                @params = {} of String => Array(String)

                HTTP::Params.parse(query) do |key, value|
                    ary = @params[key] ||= [] of String
                    ary.push value
                end
            end
        end

        def self.delete
            yield DELETE::INSTANCE
        end

        def self.delete
            DELETE::INSTANCE
        end

    end
end