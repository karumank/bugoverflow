json.array!(@bugs) do |bug|
  json.extract! bug, :id, :title, :despriction, :issue_type, :priority, :status
  json.url bug_url(bug, format: :json)
end
