namespace :work do
  task update_on_air: :environment do
    on_air_work_ids = Work.on_air.pluck(:id)
    recent_work_ids = Program.past_week(field: :started_at).pluck(:work_id).uniq
    ended_work_ids = on_air_work_ids - recent_work_ids

    Work.where(id: ended_work_ids).update_all(on_air: false)
    Work.where(id: recent_work_ids).update_all(on_air: true)
  end
end