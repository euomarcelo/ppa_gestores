Refinery::PagesController.class_eval do
  
    before_filter :find_newsarticles, :only => "home"
    before_filter :find_courses, :only => "home"
    
    MAX_NEWS_AT_HOME_PAGE = 9
    MAX_COURSES_AT_HOME_PAGE = 3
         
    protected
    
      def find_newsarticles
        @highlight = Refinery::Newsarticles::Newsarticle
          .where(:is_published => true)
          .where(:is_a_highlight => true).first
        @newsarticles = Refinery::Newsarticles::Newsarticle
          .where(:is_a_highlight => false)
          .limit(MAX_NEWS_AT_HOME_PAGE)        
      end
      
      def find_courses
        @courses = Refinery::Courses::Course
          .where(:is_active => true)
          .where("photo_id IS NOT NULL")
          .limit(MAX_COURSES_AT_HOME_PAGE)
      end
end