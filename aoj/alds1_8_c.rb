$root = nil

class Node
  attr_accessor :key, :left, :right, :parent
  def initialize key
    @key = key
  end

  def inorder
    left.inorder if left
    print " #{key}"
    right.inorder if right
  end

  def preorder
    print " #{key}"
    left.preorder if left
    right.preorder if right
  end
end

def insert(key)
  z = Node.new(key)
  x = $root
  while x
    y = x
    x = z.key < x.key ? x.left : x.right
  end

  unless y
    $root = z
  else
    z.key < y.key ? y.left = z : y.right = z
    z.parent = y
  end
end

def find(key)
  y = $root
  while y && (y.key != key)
    y = key < y.key ? y.left : y.right
  end
  return y
end

def delete(key)
  y = find(key)
  pos = position(y)
  if y.right.nil? || y.left.nil? then delete2(y,pos)
  else
    p = y.right
    while p
      break if p.left == nil
      p = p.left
    end
    y.key = p.key
    pos = position(p)
    delete2(p,pos)
  end
end

def position(n)
  n.parent.right && n.parent.right.key == n.key
end

def delete2(y,pos)
  if y.left.nil? && y.right.nil?
    pos ? y.parent.right = nil : y.parent.left = nil
  elsif y.left.nil?
    if pos
      y.parent.right = y.right
      y.parent.right.parent = y.parent
    else
      y.parent.left = y.right
      y.parent.left.parent = y.parent
    end
  elsif y.right.nil?
    if pos
      y.parent.right = y.left
      y.parent.right.parent = y.parent
    else
      y.parent.left = y.left
      y.parent.left.parent = y.parent
    end
  end
end

gets.to_i.times{
  command, key = gets.split
  case command
  when "insert"
    insert(key.to_i)
  when "find"
    puts find(key.to_i)?"yes":"no"
  when "delete"
    delete(key.to_i)
  else
    $root.inorder
    puts
    $root.preorder
    puts
  end
}