require 'spec_helper'

class RenderingSpec < ActionDispatch::IntegrationTest
  describe 'Content rendering' do
    let(:json) { blocks_json(:list_html, :text_html) }
    let(:post) { Post.create(body: json) }

    it 'renders all blocks as separate divs' do
      visit post_path(post)

      expect { all('.st__content-block').length == 2 }
    end
  end
end
