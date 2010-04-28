# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
<<<<<<< HEAD
 ActiveSupport::Inflector.inflections do |inflect|
   inflect.uncountable %w( press series )
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
 end
=======
ActiveSupport::Inflector.inflections do |inflect|
  #   inflect.plural /^(ox)$/i, '\1en'
  #   inflect.singular /^(ox)en/i, '\1'
  #   inflect.irregular 'person', 'people'
  #   inflect.uncountable %w( fish sheep )
  inflect.uncountable %w( press series games_press )
end
>>>>>>> 1a2077b7618653b1f5191387be40b27de1a3d757
