class Call < ActiveRecord::Base
  attr_accessible :client_id, :completed_p, :length, :message_id, :enter, :terminate, :hangup_enumeration, :status, :enter_listen, :terminate_listen

  belongs_to :message
  belongs_to :client

  #Retorna estado de c
  def hangup_status
    case self.hangup_enumeration
    when 'USER_BUSY'
      return I18n.t('call.hangup_status.user_busy')
    when 'SUBSCRIBER_ABSENT'
      return I18n.t('call.hangup_status.subscriber_absent')
    when 'CALL_REJECTED'
      return I18n.t('call.hangup_status.call_rejected')
    when 'NORMAL_CLEARING'
      return I18n.t('call.hangup_status.normal_clearing')
    when 'NO_ANSWER'
      return I18n.t('call.hangup_status.no_answer')
    else
      return self.hangup_enumeration
    end
  end

end
