class QuestsController < ApplicationController
  def new
    @user = current_user
    @quest = Quest.new
    @quest.quest_tasks.build
  end

  def create
    @quest = Quest.new(quest_params)

    if @quest.save

      if params[:quest][:quest_task][:question1] == "1"
          quest_task = QuestTask.new
          quest_task.quest_id  = @quest.id
          quest_task.task_id = 1
          quest_task.save
      end

      if params[:quest][:quest_task][:question2] == "1"
          quest_task = QuestTask.new
          quest_task.quest_id  = @quest.id
          quest_task.task_id = 2
          quest_task.save
      end

      redirect_to quests_path
    else
      render :new
    end
  end

  def show
    @quest = current_user.quest
    @quest_tasks = QuestTask.where(quest_id: @quest.id)
  end

  def edit
    @quest = current_user.quest
    @user = current_user
    @quest.quest_tasks.build
  end

  def update
    @quest = current_user.quest

    if @quest.update(quest_params)

      if  quest_task = QuestTask.find_by(quest_id: @quest.id,task_id: 1) #該当のタスクが存在している、かつ”２”を選んだら削除する
          if params[:quest][:quest_task][:question1] == "2"
             quest_task.destroy
          end
      elsif
          if params[:quest][:quest_task][:question1] == "1"   #”１”を選び、該当のタスクがなければ新しく作る
             quest_task = QuestTask.new
             quest_task.quest_id  = @quest.id
             quest_task.task_id = 1
             quest_task.save
          end
      end

      if  quest_task = QuestTask.find_by(quest_id: @quest.id,task_id: 2)
          if params[:quest][:quest_task][:question2] == "2"
             quest_task.destroy
          end
      elsif
          if params[:quest][:quest_task][:question2] == "1"
             quest_task = QuestTask.new
             quest_task.quest_id  = @quest.id
             quest_task.task_id = 2
             quest_task.save
          end
      end

      redirect_to quests_path
    else
      render :edit
    end
  end

  def clear
    quest = current_user.quest
    quest_tasks = QuestTask.where(quest_id: quest.id)
    if quest.destroy
        clear_quest = ClearQuest.new
          clear_quest.user_id = current_user.id
          clear_quest.start_pref = quest.start_pref
          clear_quest.start_city = quest.start_city
          clear_quest.goal_pref = quest.goal_pref
          clear_quest.goal_city = quest.goal_city
        clear_quest.save
        
        quest_tasks.each do |quest_task|
          comp_task = CompTask.new
          comp_task.clear_quest_id = clear_quest.id
          comp_task.task_id = quest_task.task_id
          comp_task.save
        end
         
    end
    redirect_to complete_path
  end

  def complete
    @user = current_user
  end

  private

  def quest_params
    params.require(:quest).permit(:user_id, :due_day, :start_pref,
    :start_city, :goal_pref, :goal_city, :is_clear,
    quest_tasks_attributes:[:quest_id, :task_id, :is_clear])
  end

  def clear_quest_params
    params.require(:clear_quest).permit(:user_id, :clear_day, :start_pref,
    :start_city, :goal_pref, :goal_city)
  end

  def comp_task_params
    params.require(:comp_task).permit(:clear_quest_id, :task_id)
  end

end
