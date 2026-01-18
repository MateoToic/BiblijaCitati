const express = require('express');
const router = express.Router();

router.get('/daily', (req, res) => {
  res.json({
    id: 1,
    text: "Gospodin je pastir moj, ni u čem ja ne oskudijevam.",
    book: "Psalam",
    chapter: 23,
    verse: 1
  });
});

module.exports = router;
