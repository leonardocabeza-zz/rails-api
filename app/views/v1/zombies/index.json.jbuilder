json.array!(@zombies) do |zombie|
	json.extract! zombie, :id, :name, :weapon
	json.message I18n.t('zombie_message', name: zombie.name)
end