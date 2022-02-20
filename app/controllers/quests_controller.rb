class QuestsController < ApplicationController
  def new
    @user = current_user
    @quest = Quest.new
    @quest.quest_tasks.build
    @questions = Question.all
  end

  def create
    @quest = Quest.new(quest_params)
    @quests = Quest.find_by(user_id: current_user,is_clear: false)
    if
    #   @quests.present?
    #   redirect_to my_page_path
    # elsif
      @quest.save

      # 必須のタスクを保存
      task_0 = Task.where(id: [1,4,6,7,8,9,10,11,12,18,21,22,23,24,25,26,27,28,29,30,31,39,40])
        task_0.each do |task|
          quest_task = QuestTask.new
            quest_task.quest_id  = @quest.id
            quest_task.task_id = task.id
            quest_task.start_time = @quest.due_day
          quest_task.save
        end

        if params[:quest][:question_4] == "1"      # 質問４で「賃貸」を選んだ場合に保存
          task_4 = Task.where(id: [2,15,16,17])
          task_4.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
              quest_task.start_time = @quest.due_day
            quest_task.save
          end
        end

        if params[:quest][:question_5] == "1"    # 質問５で「持ってる」を選んだ場合に保存
          task_5 = Task.where(id: [36])
          task_5.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
              quest_task.start_time = @quest.due_day
            quest_task.save
          end
        end

        if params[:quest][:question_6] == "1"    # 質問６で「持ってる」を選んだ場合に保存
          task_6 = Task.where(id: [3,35,37,38])
          task_6.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
              quest_task.start_time = @quest.due_day
            quest_task.save
          end
        end

        if params[:quest][:question_7] == "1"    # 質問７で「持ってる」を選んだ場合に保存
          task_7 = Task.where(id: [13,34])
          task_7.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
              quest_task.start_time = @quest.due_day
            quest_task.save
          end
        end

        if params[:quest][:question_8] == "1"    # 質問８で「一緒」を選んだ場合に保存
          task_8 = Task.where(id: [5,14,32,33])
          task_8.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
              quest_task.start_time = @quest.due_day
            quest_task.save
          end
        end

        if params[:quest][:question_9] == "1"    # 質問９で「ある」を選んだ場合に保存
          task_9 = Task.where(id: [19])
          task_9.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
              quest_task.start_time = @quest.due_day
            quest_task.save
          end
        end

        if params[:quest][:question_10] == "1"    # 質問１０で「とってる」を選んだ場合に保存
          task_10 = Task.where(id: [20])
          task_10.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
              quest_task.start_time = @quest.due_day
            quest_task.save
          end
        end

      redirect_to quest_path(@quest)
    else
      render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
    @quest_task = QuestTask.where(quest_id: @quest.id)
    @quest_tasks = QuestTask.where(quest_id: @quest.id)
  end

  # def edit
  #   @quest = Quest.find(params[:id])
  #   @user = current_user
  #   @quest.quest_tasks.build
  # end

  # def update
  #   @quest = Quest.find(params[:id])

  #   if @quest.update(quest_params)

  #     if  quest_task = QuestTask.find_by(quest_id: @quest.id,task_id: 1) #該当のタスクが存在している、かつ”２”を選んだら削除する
  #         if params[:quest][:quest_task][:question1] == "2"
  #           quest_task.destroy
  #         end
  #     elsif
  #         if params[:quest][:quest_task][:question1] == "1"   #”１”を選び、該当のタスクがなければ新しく作る
  #           quest_task = QuestTask.new
  #           quest_task.quest_id  = @quest.id
  #           quest_task.task_id = 1
  #           quest_task.save
  #         end
  #     end

  #     if  quest_task = QuestTask.find_by(quest_id: @quest.id,task_id: 2)
  #         if params[:quest][:quest_task][:question2] == "2"
  #           quest_task.destroy
  #         end
  #     elsif
  #         if params[:quest][:quest_task][:question2] == "1"
  #           quest_task = QuestTask.new
  #           quest_task.quest_id  = @quest.id
  #           quest_task.task_id = 2
  #           quest_task.save
  #         end
  #     end

  #     redirect_to quest_path(@quest)
  #   else
  #     render :edit
  #   end
  # end

  def clear
    quest = Quest.find(params[:id])
    quest_tasks = QuestTask.where(quest_id: quest.id)
    quest.update(quest_params)
    redirect_to complete_path
  end

  def complete
    @user = current_user
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :due_day, :start_pref,
    :start_city, :goal_pref, :goal_city, :is_clear)
  end
  
  def quest_task_params
    params.require(:quest_task).permit(:quest_id, :task_id, :is_clear)
  end

end
