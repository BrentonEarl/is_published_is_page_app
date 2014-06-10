require './db/models/init'

print "Seeding database.\n\n"

if Articles.count == 0
	2.times do
		# An article that is a Post and published
		Articles.create(
		title: "This is a post that is published",
		body: "This is the post body",
		is_page: false,
		is_published: true
		)
	end
	
	2.times do
		# An article that is a Post and unpublished
		Articles.create(
		title: "This is a post that isn't published'",
		body: "This is the post body",
		is_page: false,
		is_published: false
		)
	end
	print "Created Posts.\n"

	1.times do
		# An article that is a Page and unpublished
		Articles.create(
		title: "This is a page that isn't published'",
		body: "This is the page body",
		is_page: true,
		is_published: false
		)
	end
	
	1.times do
		# An article that is a Page and published
		Articles.create(
		title: "This is a page that is published.",
		body: "This is the page body",
		is_page: true,
		is_published: true
		)
	end

	print "Created Pages.\n\n"
else
	print "Pages and Posts already exist.\n\n"
end

