
###########################
### Double Linked List ####
###########################

class Double_node
  attr_accessor :before, :after, :value

  def initialize(value = nil, before = nil, after = nil)
    @value = value
    @before = before
    @after = after
  end

end

class Double_linked_list

  attr_accessor :head, :tail

  def initialize(head = Double_node.new, tail = Double_node.new)
    head.after = tail
    tail.before = head
    @head = head
    @tail = tail
  end

  def seed
    push(Double_node.new(2))
    push(Double_node.new(9))
    push(Double_node.new(6))
    push(Double_node.new(4))
    push(Double_node.new(12))
    push(Double_node.new(3))
    push(Double_node.new(1))
    push(Double_node.new(5))
  end

  def push(new_node)
    second_to_last = @tail.before
    second_to_last.after = new_node
    @tail.before = new_node
    new_node.before = second_to_last
    new_node.after = @tail
  end

  def print
    node = @head
    while node
      puts node.value
      node = node.after
    end
    nil
  end


# Cracking Code Interview 2.1

  def delete_from_list(node)
    node.before.after = node.after
    node.after.before = node.before
  end

  def remove_dups
    node = @head.after
    my_hash = Hash.new(false)
    while node
      if my_hash[node.value]
        next_node = node.after
        delete_from_list(node)
        node = next_node
      else
        my_hash[node.value] = true
        node = node.after
      end
    end
  end

  # Cracking Code Interview 2.4
  # TODO make this not a bang method

  def my_concat(other_list)
    new_list = Double_linked_list.new
    node = self.head.after
      while node.value
        next_node = node.after
        new_list.push(node)
        node = next_node
      end
    node = other_list.head.after
      while node.value
        next_node = node.after
        new_list.push(node)
        node = next_node
      end
    return new_list
  end

  def my_partition(target)
    left_side = Double_linked_list.new
    right_side = Double_linked_list.new
    node = @head.after
    target_node = 0
    while node.value
      next_node = node.after

      #if we are to left of target
      if node.value < target
        left_side.push(node)

      #if we are to right of target
      elsif node.value > target
        right_side.push(node)
      elsif node.value == target
        target_node += 1
      end
      node = next_node
    end

    target_node.times do
      left_side.push(Double_node.new(target))
    end

    return left_side.my_concat(right_side)
  end

end

###########################
### Single Linked List ####
###########################

class Single_node
  attr_accessor :after, :value

  def initialize(value = nil, after = nil)
    @value = value
    @after = after
  end

end

class Single_linked_list

  attr_accessor :head

  def initialize(head = Single_node.new, tail = Single_node.new)
    head.after = tail
    @head = head
    @tail = tail
  end

  def seed
    push(Single_node.new(1))
    push(Single_node.new(2))
    push(Single_node.new(3))
    push(Single_node.new(4))
    push(Single_node.new(5))
    push(Single_node.new(4))
  end

  def push(new_node)
    node = @head
    while node.after.value != nil
      node = node.after
    end
    node.after = new_node
    new_node.after = @tail
  end

  def print
    node = @head
    while node
      puts node.value
      node = node.after
    end
    nil
  end

  def kth_last(k)
    node = @head.after
    count = 0
    while node.value
      node = node.after
      count += 1
    end
    node = @head.after
    (count - k).times do
      node = node.after
    end
    node
  end

  def mid_delete(node)
    node.value = node.after.value
    node.after = node.after.after
  end

end
