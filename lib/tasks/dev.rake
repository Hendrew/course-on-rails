namespace :dev do
  PASSWORD_DEFAULT = "123456"

  desc "Development enviroment setup"
  task setup: :environment do
    if Rails.env.development?
      Rake::Task["db:drop"].invoke
      Rake::Task["db:create"].invoke
      Rake::Task["db:migrate"].invoke
      Rake::Task["dev:add_default_user"].invoke
      Rake::Task["dev:add_default_courses"].invoke
      Rake::Task["dev:add_default_expired_course"].invoke
    else
      puts "You aren\"t in development environment"
    end
  end

  desc "Add default user"
  task add_default_user: :environment do
    User.create!(
      name: "Dev",
      email: "dev@user.com",
      password: PASSWORD_DEFAULT,
      active: true,
    )
  end

  desc "Add default courses"
  task add_default_courses: :environment do
    courses = [
      "JavaScript Fundamental",
      "Ruby from Scratch to Professional",
      "Professional Ruby on Rails",
      "The Ultimate Docker Course",
      "Faster Deployment with Kamal",
      "Monitoring with New Relic"
    ]

    courses.each do |course|
      course = Course.create!(
        title: course,
        image: Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/course-cover.png"), "image/png"),
        description: Faker::Lorem.paragraph,
        end_date: Date.current + [5, 10, 15, 20].sample.days,
      )

      video = Rack::Test::UploadedFile.new(Rails.root.join("spec/support/files/video.mp4"), "video/mp4")

      [12, 15, 18].sample.times do
        course.contents.create!(title: Faker::Lorem.sentence, video:)
      end
    end
  end

  desc "Add default expired course"
  task add_default_expired_course: :environment do
    course = Course.first
    course.update_attribute(:end_date, Date.current - 5.days)
  end
end
