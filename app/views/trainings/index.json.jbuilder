json.array!(@trainings) do |training|
  json.extract! training, :id, :movie, :explain, :muscle
  json.url training_url(training, format: :json)
end
