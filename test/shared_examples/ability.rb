class ActiveSupport::TestCase
  class << self
    def should_have_public_permissions
      should "have public permissions" do
        [Address, Agency, Account, ContractExpense, ContractPlan, Contract, PartialPayment, PaymentPlan, Payment, Property, SimpleData, SubAccount, Tax, UserAgency, User].each do |klass| 
          assert @ability.cannot? :manage, klass
        end
        assert_empty @ability.permissions[:can]
      end
    end

    def should_be_able_to_manage_only_related(&block)
      should 'be able to manage only related' do 
        instance_exec(&block)
        @cannot_manage.each do |cant| 
          assert @user.cannot?(:manage, cant)
        end
        @can_manage.each do |can| 
          assert @user.can?(:manage, can)
        end
      end
    end

    def should_have_owner_permissions
      # There arent owners permissions yet (might be in future versions)
      should_have_public_permissions
    end
    
    def should_have_tenant_permissions
      # There arent tenat permissions yet (might be in future versions)
      should_have_public_permissions
    end
  end
end