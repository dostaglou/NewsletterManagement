module Mutations
  class SubscriberRemove < BaseMutation
    argument :subscriber_id, ID, required: true
    argument :newsletter_id, ID, required: true

    field :msg, String, null: false
    field :subscriber, Types::SubscriberType, null: true

    def resolve(newsletter_id:, subscriber_id:)
      self.me?
      message = "Please reconfirm sub id or newsletter"
      return { msg: message, subscriber: nil } unless me.newsletters.pluck(:id).include?(newsletter_id.to_i)
      return { msg: "Subscriber not found", subscriber: nil } unless entry = Subscriber.find_by(id: subscriber_id, newsletter_id: newsletter_id)
      entry.destroy
      { msg: "subscriber removed", subscriber: entry }
    end
  end
end