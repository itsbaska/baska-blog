require 'rails_helper'

describe PostsController do
  describe "posts#index" do
    it "should be index" do
      get :index
    end

    it "should assign posts" do
      Post.create(title: "title", body: "I love Lamp")
      get  :index
      expect(assigns(:posts).length).to eq(1)
    end
  end
end
