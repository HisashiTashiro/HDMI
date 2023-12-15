class CombinationsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
 
  def index
    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      @combinations = Combination.joins(:user).where("about LIKE ? OR kind LIKE ? OR hashbody LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      @combinations = Combination.all
    end
  end

  def new
        @combination = Combination.new
      end
    
      def create
        combination = Combination.new(combination_params)
        combination.user_id = current_user.id 
        
        if combination.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

  def show
        @combination = Combination.find(params[:id])
# 追記ここから
        @comments = @combination.comments
        @comment = Comment.new
# 追記ここまで
  end

  def edit
    @combination = Combination.find(params[:id])
  end

  def update
    combination = Combination.find(params[:id])
    if combination.update(combination_params)
      redirect_to :action => "show", :id => combination.id
    else
      redirect_to :action => "new"
    end
  end
  def destroy
      combination = Combination.find(params[:id])
      combination.destroy
      redirect_to action: :index
  end

  def hashtag  
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.combinations.count}
    else
      name = params[:name]
      name = name.downcase
      @hashtag = Hashtag.find_by(hashname: name)
      @combination = @hashtag.combinations
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.combinations.count}
    end
  end

      private
      def combination_params
        params.require(:combination).permit(:about, :kind, :image, :hashbody, combinations: [], hashtag_ids: [])
      end
     #ここまで
    
    end
