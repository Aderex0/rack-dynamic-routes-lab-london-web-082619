require "pry"

class Application

    # @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            last_item = req.path.split("/items/").last
            
            if item = @@items.find {|item| item.name == last_item}
                resp.write item.price

            else 
                resp.write "Item not found"
                resp.status = 400
            end
        else
             resp.write "Route not found"
             resp.status = 404
        end
        resp.finish
    end

end
