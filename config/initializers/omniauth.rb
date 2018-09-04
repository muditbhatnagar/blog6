Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '454513015034954', '4b48e9d4570039e4ed50103ade6ab690'
  provider :linkedin, '783sdajz9q4k5r', 'XTVnhHC4FUQVc6DH'
  #provider :google, '731848018382-g16kobi6mlshoitti2rqaopc787absl5.apps.googleusercontent.com', 'TqFATE0Se1U3X1shKVczoXWm', scope: 'plus.login'
  provider :twitter, 'y6kILe3VwuGpaFIIfPXdnv8pw', 'Gb76xJS6ZvTrzzxp0jNFLnZG2nNhNaaNPfx5FAWLrL5y11e14D'
  provider :google_oauth2, '861936816315-q8ac4ckklhsv7khgbnlo8bbo825r99ss.apps.googleusercontent.com', 'DGt0tDvWkp_xC-GHEHnoOikd', scope: 'email'
end
