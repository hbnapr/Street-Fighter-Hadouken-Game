/// x_remove_dupes(keylog, allowed_dupes)

// Create local variables
var keylog, dupes_allowed


// Get arguments
keylog = argument0;
dupes_allowed = argument1;

// How many keys we actually are remembering
length = string_length(keylog);

// Only do something when we have more than 1
if( length > 1) {

// "DDDDDDSSSSSDDDDDDDDDDDDSSSSSDDSSSSSSS"
// 

    //set up a counter
    counter = 1;

    //create temporary variable to store all characters that are going to be "in"
    newlog = "";

    //loop through every letter in the keylog back to front
    for(key = length; key > 0; key -= 1) {
        
        //first character is always in
        if(key == length) {
            newlog = string_char_at(keylog, key) + newlog;
            counter = 0;
        } else {
            //free entrance when the dupe counter is triggered
            if(counter >= dupes_allowed) {
                newlog = string_char_at(keylog, key) + newlog;
                counter = 0;
            } else {
                //If you are different from the next character then you are in.
                if (string_char_at(keylog, key) !=  string_char_at(keylog, key + 1))  {
                    newlog = string_char_at(keylog, key) + newlog;
                    counter = 0;
                }
            }
        } 
        //update dupe counter
        counter += 1;
    }
    //return our new log
    return newlog;
    
} else {
    //not enough character. just give back keylog
    return keylog;
}
