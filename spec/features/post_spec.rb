require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostHelper. For example:
#
# describe PostHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
# RSpec.describe PostHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe 'new post' do
  it 'ensures that the form route works with the /new action' do
    visit new_post_path
    expect(page.status_code).to eq(200)
  end

  it 'render HTML in the /new template' do
    visit new_post_path
    expect(page).to have_content('Post Form')
  end

  it "displays a new post form that redirects to the index page, which then contains the submitted post's title and description" do
    visit new_post_path
    fill_in 'post_title', with: 'My post title'
    fill_in 'post_description', with: 'My post description'

    click_on 'Submit Post'

    expect(page.current_path).to eq(posts_path)
    expect(page).to have_content ('My post title')
    expect(page).to have_content('My post description')
  end
end
