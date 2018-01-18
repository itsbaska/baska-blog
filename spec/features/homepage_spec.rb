require "rails_helper"
feature "the homepage" do
  scenario "a user can see all the posts" do
    post = Post.create(:title => "My best cat gif", :body => "Funny cat gif")
    visit('/')
    expect(page).to have_link post.title
  end
end
