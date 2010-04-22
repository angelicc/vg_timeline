Paperclip.interpolates :title do |attachment, style|
  name = attachment.instance.full_title
  name = name.downcase
  name = name.tr("\'\"", "")
  name = name.tr('#.:;-/\\', " ")
  name = name.split.join('_')
  name + "_" + attachment.instance.platform.short_name
end

Paperclip.interpolates :release_year do |attachment, style|
  rel_date = Time.parse(attachment.instance.release_date.to_s)
  rel_date.year
end

Paperclip.interpolates :release_month do |attachment, style|
  rel_date = Time.parse(attachment.instance.release_date.to_s)
  month = rel_date.month.to_s
  if month.length == 1
    month = "0" + month.to_s
  end
  month
end