create table user_subscriptions (
    channel_id INT not null references usr,
    subscriber_id INT not null references usr,
    primary key (channel_id, subscriber_id)
)