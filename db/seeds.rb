# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
user_new = User.create!({ email: 'user@missionmgmt.org',
                      password: 'changeThis',
                      password_confirmation: 'changeThis',
                      admin: false })
user_new.skip_confirmation!
user_new.save!

user_admin = User.create!({ email: 'admin@missionmgmt.org',
                      password: 'changeThis',
                      password_confirmation: 'changeThis',
                      admin: true })
user_admin.skip_confirmation!
user_admin.save!
