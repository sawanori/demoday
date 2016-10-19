json.extract! postarticle, :id, :user_id, :spot_id, :title, :content, :created_at, :updated_at
json.url postarticle_url(postarticle, format: :json)