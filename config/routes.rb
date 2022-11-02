Rails.application.routes.draw do
  get "/tiny_hippo", controller: "products", action: "tiny_hippo"

  get "/sleepy_dragon", controller: "products", action: "sleepy_dragon"
end
