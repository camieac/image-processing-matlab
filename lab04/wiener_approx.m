function W = wiener_approx(H, G, k )
  W = (conj(H)./(abs(H).^2 + k)).*G;
end

