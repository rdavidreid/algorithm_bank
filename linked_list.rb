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
    push(Double_node.new("one"))
    push(Double_node.new("two"))
    push(Double_node.new("three"))
    push(Double_node.new("four"))
    push(Double_node.new("five"))
    push(Double_node.new("four"))
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

end

class Single_node
  attr_accessor :after, :value

  def initialize(value = nil, after = nil)
    @value = value
    @after = after
  end

end

class Single_linked_list

  attr_accessor :head

  def initialize(head = Double_node.new, tail = Double_node.new)
    head.after = tail
    tail.before = head
    @head = head
  end

  def push(new_node)
    node = @head
    while node.after != nil
      node = node.after
    end
    node.after = new_node
    new_node.after = nil
  end

  def print_list
    node = @head
    while node
      puts node.value
      node = node.after
    end
    nil
  end

end
