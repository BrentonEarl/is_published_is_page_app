#!/usr/bin/env ruby

require 'sinatra'
require 'sqlite3'
require 'sinatra/activerecord'

require_relative "db/environments"
require_relative "db/models/init"

get '/' do
	menu
	all_published_posts
	erb :index
end

get '/page/:id' do
	menu
	published_page
	erb :page
end

get '/post/:id' do
	menu
	published_post
	erb :post
end

get '/admin' do
	menu
	@unpublished_posts = find_all_articles(false,false)
	@unpublished_pages = find_all_articles(true,false)
	erb :admin
end


helpers do
	def find_article_by_id(type, status, param_id)
		# Find Article by id
		# Paramaters article.is_page / article.is_published / article.id
		@article = Articles.where(is_page: type, is_published: status).find_by(id: param_id)
	end
	
	def find_all_articles(type, status)
		# Find all articles and order them descending
		# Paramaters article.is_page / article.is_published
		@article = Articles.where(is_page: type, is_published: status).order("created_at DESC")
	end
	
	def published_page
		# List 1 Published Page
		@page = find_article_by_id(true,true, params[:id])
	end

	def published_post
		# List 1 Published Post
		@post = find_article_by_id(false,true, params[:id])
	end

	def all_published_pages
		# List all Published Pages
		@all_pages = find_all_articles(true, true)
	end
	
	def all_published_posts
		# List all Published Posts
		@all_posts = find_all_articles(false,true)
	end
	
	def menu
		@menu = all_published_pages
	end
end
