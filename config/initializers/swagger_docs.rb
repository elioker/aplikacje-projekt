
#config/initializers/swagger-docs.rb
Swagger::Docs::Config.register_apis({
  "1.0" => {
    :api_extension_type => :json,
    :api_file_path => "public/",
    :base_path => "http://localhost:3000",
    :clean_directory => true,
    :attributes => {
      :info => {
        "title" => "eBazarek",
        "description" => "Example rails app"
      }
    }
  }
})