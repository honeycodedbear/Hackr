require "rails_helper"

RSpec.describe User, :type => :model do
  it "Like Each Other" do
    max = User.create!(name: "Max")
    hannah = User.create!(name: "Hannah")

    expect(User.order(:name)).to eq([hannah, max])

    like1 = Like.create!(userA_id: max.id, userB_id: hannah.id)
    like2 = Like.create!(userA_id: hannah.id, userB_id: max.id)

    expect(max.findMutualLikes).to eq([hannah])
  end
end
