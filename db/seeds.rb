
@user_delete = User.find_by(email: "example@mail.com")
@user_delete.destroy unless @user_delete == nil

@user = User.create(name: "John Doe", email: "example@mail.com", password: "passme", password_confirmation: "passme")
@user.activities.create(name: "Swimming", units: "km")
@user.activities.create(name: "Running", units: "km")
@user.activities.create(name: "Drinking Alcohol", units: "drinks")
@user.activities.create(name: "Sleeping", units: "hrs")
@user.activities.create(name: "Working", units: "hrs")

@user.activities.each do |activity|
	today = Date.today
	for i in 1..50
		activity.entries.create(date: today - i.day, units: Random.rand(10))
	end
end
