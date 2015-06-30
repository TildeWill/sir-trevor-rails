require 'spec_helper'

class EditingSpec < ActionDispatch::IntegrationTest
  describe 'Edit form' do
    let(:json) { '[{"type":"text","data":{"text":"asdf"}}]' }
    let(:post) { Post.create(body: json) }

    it 'serializes BlockArray to correct json' do
      visit edit_post_path(post)
      expect { find_field('Body').value == post.body.to_json }
    end

    it 'serializes empty BlockArray to empty array json' do
      post = Post.create()

      visit edit_post_path(post)
      expect { find_field('Body').value == "[]" }
    end
  end
end
