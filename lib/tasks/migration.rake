namespace :migration do
  desc "TODO"
  task fix_user_uid: :environment do
    puts 'Fixing User UIDs and provider fields...'
    # inspired by https://github.com/lynndylanhurley/devise_token_auth/issues/181
    User.reset_column_information
    User.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end
    puts 'Done.'
  end
end
