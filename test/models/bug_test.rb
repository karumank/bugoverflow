require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
     def setup
         @bug = Bug.create(title: "a title", despriction: "This is the actual text of ou
     r despriction.  It can be rather long.", issue_type: 0, status: 1, priority: 0)
     end
    test "bug must be valid" do
        assert @bug.valid?
    end
    test "title must be present" do
        @bug.title = ""
        assert_not @bug.valid?
    end
    test "title must not be too short" do
        @bug.title = "aa"
        assert_not @bug.valid?
    end
    test "title must not be too long" do
        @bug.title = "a" * 81
        assert_not @bug.valid?
    end
    test "despriction must be present" do
        @bug.despriction = ""
        assert_not @bug.valid?
    end
    test "despriction must not be too short" do
        @bug.despriction = "aa"
        assert_not @bug.valid?
    end
    test "despriction must not be too long" do
        @bug.despriction = "a" * 601
        assert_not @bug.valid?
    end
    test "status must be valid" do
        invalid_statuses = [-10, -1, 5, 10]
        invalid_statuses.each do |is|
            begin
                @bug.status = is
                assert false, "#{is} should be invalid"
            rescue
                assert true
            end
          end
      end
      test "priority must be valid" do
        invalid_priorities = [-10, -1, 5, 10]
        invalid_priorities.each do |is|
            begin
                @bug.priority = is
                assert false, "#{is} should be invalid"
            rescue
                assert true
            end
          end
      end
      test "issue_type must be valid" do
        invalid_issue_types = [-10, -1, 5, 10]
        invalid_issue_types.each do |is|
            begin
                @bug.issue_type = is
                assert false, "#{is} should be invalid"
            rescue
                assert true
            end
         end
       end
end
