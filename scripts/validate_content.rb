require "yaml"
require "uri"

def read_yaml(path)
  YAML.safe_load(File.read(path, encoding: "UTF-8"), permitted_classes: [], aliases: false)
end

def required(hash, fields, context)
  raise "#{context}: expected an object" unless hash.is_a?(Hash)
  fields.each { |field| raise "#{context}: missing #{field}" if hash[field].to_s.strip.empty? }
end

def link(value, context)
  return if value.nil? || value == ""
  raise "#{context}: expected a string URL" unless value.is_a?(String)
  if value.start_with?("/") && !value.start_with?("//")
    path = value.split(/[?#]/).first.delete_prefix("/")
    raise "#{context}: invalid local path" if path.split("/").include?("..")
    raise "#{context}: missing file #{path}" unless File.file?(path)
  else
    uri = URI.parse(value)
    raise "#{context}: use an absolute https URL" unless uri.scheme == "https" && uri.host
  end
rescue URI::InvalidURIError
  raise "#{context}: invalid URL"
end

profile = read_yaml("_data/homepage.yml")
required(profile, %w[name role affiliation affiliation_url email intro], "profile")
%w[email alternate_email].each do |key|
  value = profile[key]
  next if value.nil? || value == ""
  raise "profile: invalid #{key}" unless value.match?(/\A[^\s@]+@[^\s@]+\.[^\s@]+\z/)
end
%w[photo cv affiliation_url].each { |key| link(profile[key], key) }
schemas = {
  "links" => %w[label url], "research" => %w[title description],
  "news" => %w[date text], "education" => %w[period institution department location],
  "awards" => %w[date text], "talks" => %w[date text],
  "service" => %w[category title text]
}
schemas.each do |key, fields|
  items = profile.fetch(key, [])
  raise "#{key}: expected a list" unless items.is_a?(Array)
  items.each_with_index do |item, i|
    required(item, fields, "#{key}[#{i}]")
    link(item["url"], "#{key}[#{i}].url") if key == "links"
    if item.key?("links")
      raise "#{key}[#{i}].links: expected a list" unless item["links"].is_a?(Array)
      item["links"].each do |entry|
        required(entry, %w[label url], "#{key}[#{i}].links")
        link(entry["url"], "#{key}[#{i}].links.url")
      end
    end
  end
end
papers = read_yaml("_data/publications.yml")
raise "publications: expected a list" unless papers.is_a?(Array)
papers.each_with_index do |paper, i|
  required(paper, %w[title authors year venue], "publication #{i + 1}")
  raise "publication #{i + 1}: year must be an integer" unless paper["year"].is_a?(Integer)
  %w[url pdf code data].each { |key| link(paper[key], "publication #{i + 1}.#{key}") }
end
puts "Validated profile and #{papers.length} publications."
