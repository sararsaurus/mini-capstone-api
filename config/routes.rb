Rails.application.routes.draw do
  # get "/tiny_hippo", controller: "products", action: "tiny_hippo"

  # get "/sleepy_dragon", controller: "products", action: "sleepy_dragon"

  get "/all_products", controller: "products", action: "all_products"

  get "/first_product", controller: "products", action: "first_product"
end
