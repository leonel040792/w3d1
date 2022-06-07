class Array
    
    def  my_each(&prc)
        i=0
        while  i < self.length

            prc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&prc)
        new_arr=[]
        self.my_each {|ele| new_arr << ele if prc.call(ele)}
        new_arr
    end

    def my_reject(&prc)
        new_arr=[]
        self.my_each {|ele| new_arr << ele unless prc.call(ele)}
        new_arr
    end

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        false
    end 

    def my_all?(&prc)
        self.my_each {|ele| return false if !prc.call(ele)}
        true
    end

    def my_flatten   
        ans = []
        return self[0] if self.length==1
        self.my_each do |ele|
            if ele.is_a?(Array)
                ans += ele.my_flatten 
            else
                ans << ele
            end
        end
        ans
    end


    def my_zip(*args)
        ans = []
         (0...self.length).each do |i|
            subarr = [self[i]]
           args.each { |arg| subarr << arg[i]}
           ans << subarr
         end
         ans
    end
    

    def my_rotate(num=1)  #WE NEED HELP!!!!!!
    #   newnum = num % self.length
    #   self.drop(newnum) + self.take(newnum)

    temp=self.map {|e| e}
        if num>0
            num.times do 
                temp.push(temp.shift)
            end
        elsif num < 0
            backwards= num*-1
            backwards.times do
                temp.unshift(temp.pop)    
            end
        end
        temp
    end

    def my_join(separator = "")
        newstr = ""
        self.my_each do |ele|
            newstr += ele
            newstr += separator
        end
        newstr[-1] = "" if newstr[-1] == separator
        newstr
    end

    def my_reverse
        ans=[]
        self.my_each { |ele| ans.unshift(ele) }
        ans
    end
    
end

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
