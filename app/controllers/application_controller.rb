class ApplicationController < ActionController::Base

    def hello_world
        render html: "Hello, world"
    end

    def alta_ruta
        # render html: "Alta ruta"
    end
end
