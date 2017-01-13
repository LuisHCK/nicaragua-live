module CouponRedemptionsHelper
    def coupon_buttons(coupon)
        if current_user.redeemed?(coupon)
            content_tag(:div,class:"alert alert-success") do
                "¡Genial! Ya reclamaste tu cupón"    
            end
            else
            link_to coupon_redemptions_path(user_id: current_user.id, coupon_id: coupon.id), class:"btn btn-success",style:"display: block; width: 100%", method: :post, remote: true do
                icon('ticket')
            end
        end
    end
end
