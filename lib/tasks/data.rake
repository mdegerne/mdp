namespace :data do
  data_dir = File.join(RAILS_ROOT, "db","import")

  desc "Import Static Tables"
  task :imp_static => [:environment] do
    require 'active_record/fixtures'

    tables = ["headings","questions"]
    tables.each do |t|
      Fixtures.create_fixtures(data_dir, t)
    end
  end
end
