require "rails_helper"

describe "Post" do
  it "should have a title" do
    title = "This be title"
    post = Post.new(title: title)
    expect(post.title).to eq title
  end
  it "should have body content" do
    body = "This be body content"
    post = Post.new(body: body)
    expect(post.body).to eq body
  end
end
