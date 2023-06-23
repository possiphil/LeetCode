// https://leetcode.com/problems/unique-email-addresses/submissions/975231574/

private class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var uniqueEmails: Set<String> = []

        for email in emails {
            var formattedEmail = ""
            var name = true
            var del = false

            for char in email {
                if char == "@" { 
                    del = false 
                    name = false
                }
                
                if (char == "." && name) || del { continue }
                else if char == "+" && name {
                    del = true
                    continue
                } else { formattedEmail += String(char) }
            }

            uniqueEmails.insert(formattedEmail)
        }

        return uniqueEmails.count        
    }
}