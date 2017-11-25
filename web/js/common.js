		String.prototype.startWith=function(str){  
            if(str==null||str==""||this.length==0||str.length>this.length)  
              return false;  
            if(this.substr(0,str.length)==str)  
              return true;  
            else  
              return false;  
            return true;  
        }  
        String.prototype.endWith=function(str){  
            if(str==null||str==""||this.length==0||str.length>this.length)  
              return false;  
            if(this.substring(this.length-str.length)==str)  
              return true;  
            else  
              return false;  
            return true;  
        }  