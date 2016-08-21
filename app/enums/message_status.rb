# Enum class with message statuses
#
# rohan.jha

class MessageStatus < Enum
  ACTIVE = 1
  INACTIVE = 2
  POSITIVE = 3
  NEGATIVE = 4
end