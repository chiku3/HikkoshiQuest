class QuestsController < ApplicationController
  def new
    @user = current_user
    @quest = Quest.new
    @quest.quest_tasks.build
  end

  def create
    @quest = Quest.new(quest_params)
    @quests = Quest.find_by(user_id: current_user,is_clear: false)
    if
      @quests.present?
      flash[:notice] = "現在進行中のクエストがあるため保存できませんでした。"
      redirect_to my_page_path
    elsif
      @quest.save

      # カレンダー表示用タスクを保存
          quest_task = QuestTask.new
            quest_task.task_id = 1
            quest_task.quest_id  = @quest.id
            quest_task.start_time = @quest.created_at  # クエスト開始日
          quest_task.save
          quest_task = QuestTask.new
            quest_task.task_id = 2
            quest_task.quest_id  = @quest.id
            quest_task.start_time = @quest.due_day.ago(30.days)  # 引越し３０日前
          quest_task.save
          quest_task = QuestTask.new
            quest_task.task_id = 3
            quest_task.quest_id  = @quest.id
            quest_task.start_time = @quest.due_day.ago(14.days)  # 引越し１４日前
          quest_task.save
          quest_task = QuestTask.new
            quest_task.task_id = 4
            quest_task.quest_id  = @quest.id
            quest_task.start_time = @quest.due_day  # 引越し当日
          quest_task.save
          quest_task = QuestTask.new
            quest_task.task_id = 5
            quest_task.quest_id  = @quest.id
            quest_task.start_time = @quest.due_day.since(14.days)  # 引越し１４日後
         quest_task.save

      # 必須のタスクを保存
      if  @quest.start_pref == @quest.goal_pref and @quest.start_city == @quest.goal_city
        task_0 = Task.where(id: [6,9,11,21,24,27,28,29,31,32,33,34,35,36,44,45])  # 同市区町村の場合
          task_0.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
      else
        task_0 = Task.where(id: [6,9,11,13,14,15,21,24,27,28,30,31,32,33,34,35,36,44,45])  # 異なる市区町村の場合
          task_0.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
      end

        if params[:quest][:question_4] == "1"      # 質問４で「賃貸」を選んだ場合に保存
          task_4 = Task.where(id: [7,16,17,18,25,26])
          task_4.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

        if params[:quest][:question_5] == "1"    # 質問５で「持ってる」を選んだ場合に保存
          task_5 = Task.where(id: [37])
          task_5.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

        if params[:quest][:question_6] == "1"    # 質問６で「持ってる」を選んだ場合に保存
          task_6 = Task.where(id: [8,38,39,40])
          task_6.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

        if params[:quest][:question_7] == "1"    # 質問７で「持ってる」を選んだ場合に保存
          task_7 = Task.where(id: [20,41])
          task_7.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

        if params[:quest][:question_8] == "1"    # 質問８で「一緒」を選んだ場合に保存
          task_8 = Task.where(id: [10,19,42,43])
          task_8.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

        if params[:quest][:question_9] == "1"    # 質問９で「してる」を選んだ場合に保存
          task_9 = Task.where(id: [12])
          task_9.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

        if params[:quest][:question_10] == "1"    # 質問１０で「ある」を選んだ場合に保存
          task_10 = Task.where(id: [22])
          task_10.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

        if params[:quest][:question_11] == "1"    # 質問11で「とってる」を選んだ場合に保存
          task_11 = Task.where(id: [23])
          task_11.each do |task|
            quest_task = QuestTask.new
              quest_task.quest_id  = @quest.id
              quest_task.task_id = task.id
            quest_task.save
          end
        end

      flash[:notice] = "クエストが発生しました！"
      redirect_to quest_path(@quest)

    else
	    redirect_to new_quest_path, flash:{ danger: @quest.errors.full_messages.join(',')}
    end
  end

  def show
    @quest = Quest.find(params[:id])
    @quest_task = QuestTask.where(quest_id: @quest.id).where("task_id > ?", 5)     #すべての実行タスク
    @quest_tasks = QuestTask.where(quest_id: @quest.id).where("task_id < ?", 6)    #カレンダー表示用
    @quest_task_1 = QuestTask.where(quest_id: @quest.id).where(task_id: [6..10]).order(:task_id)    #すぐやろうタスク
    @quest_task_2 = QuestTask.where(quest_id: @quest.id).where(task_id: [11,12]).order(:task_id)    #引越し３０日前頃にやろうタスク
    @quest_task_3 = QuestTask.where(quest_id: @quest.id).where(task_id: [13..24]).order(:task_id)  #引越し１４日前頃にやろうタスク
    @quest_task_4 = QuestTask.where(quest_id: @quest.id).where(task_id: [25..28]).order(:task_id)    #引越し当日にやろうタスク
    @quest_task_5 = QuestTask.where(quest_id: @quest.id).where(task_id: [29..45]).order(:task_id)   #引越し後１４日以内にやろうタスク
  end

  def update
    quest = Quest.find(params[:id])
    quest.update(quest_params)
    redirect_to clear_path
  end

  def clear
    @user = current_user
  end

  def complete
    @quest = Quest.find(params[:id])
    @quest_task = QuestTask.where(quest_id: @quest.id).where("task_id > ?", 5)     #すべての実行タスク
    @quest_tasks = QuestTask.where(quest_id: @quest.id).where("task_id < ?", 6)    #カレンダー表示用
    @quest_task_1 = QuestTask.where(quest_id: @quest.id).where(task_id: [6..10]).order(:task_id)    #すぐやろうタスク
    @quest_task_2 = QuestTask.where(quest_id: @quest.id).where(task_id: [11,12]).order(:task_id)    #引越し３０日前頃にやろうタスク
    @quest_task_3 = QuestTask.where(quest_id: @quest.id).where(task_id: [13..24]).order(:task_id)  #引越し１４日前頃にやろうタスク
    @quest_task_4 = QuestTask.where(quest_id: @quest.id).where(task_id: [25..28]).order(:task_id)    #引越し当日にやろうタスク
    @quest_task_5 = QuestTask.where(quest_id: @quest.id).where(task_id: [29..45]).order(:task_id)   #引越し後１４日以内にやろうタスク
  end

  def destroy
    quest = Quest.find(params[:id])
    quest.destroy
    redirect_to my_page_path
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
